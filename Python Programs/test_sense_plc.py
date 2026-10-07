import os
import glob
import time
import logging
from pycomm3 import LogixDriver

# Suppress internal pycomm3 CIP fallback warnings
logging.getLogger('pycomm3').setLevel(logging.CRITICAL)

# --- SENSE HAT DIRECT FRAMEBUFFER DRIVER ---
def get_sense_hat_fb():
    for fb in glob.glob('/sys/class/graphics/fb*'):
        try:
            with open(os.path.join(fb, 'name'), 'r') as f:
                if 'RPi-Sense FB' in f.read():
                    return f"/dev/{os.path.basename(fb)}"
        except IOError:
            continue
    return '/dev/fb0'

FB_DEV = get_sense_hat_fb()

def set_matrix_color(r, g, b):
    r_5 = (r >> 3) & 0x1F
    g_6 = (g >> 2) & 0x3F
    b_5 = (b >> 3) & 0x1F
    pixel = (r_5 << 11) | (g_6 << 5) | b_5
    pixel_bytes = pixel.to_bytes(2, byteorder='little') * 64

    with open(FB_DEV, 'wb') as fb:
        fb.write(pixel_bytes)

def clear_matrix():
    set_matrix_color(0, 0, 0)
# -------------------------------------------

# Colors (R, G, B)
COLOR_OFF   = (0, 0, 0)
COLOR_TARE  = (0, 255, 0)    # Green
COLOR_STOP  = (255, 0, 0)    # Red
COLOR_START = (0, 128, 255)  # Blue

PLC_PATH = '192.168.1.103'

print(f"Connecting to CompactLogix at {PLC_PATH}...")
clear_matrix()

try:
    with LogixDriver(PLC_PATH, init_connection=False, large_packets=False) as plc:
        print("Connected successfully. Monitoring tags (Ctrl+C to exit)...")

        while True:
            results = plc.read('IMU_Tare', 'Db_Stop', 'Data_Start')

            tare_val  = bool(results[0].value) if results[0].error is None else False
            stop_val  = bool(results[1].value) if results[1].error is None else False
            start_val = bool(results[2].value) if results[2].error is None else False

            if stop_val:
                set_matrix_color(*COLOR_STOP)
            elif tare_val:
                set_matrix_color(*COLOR_TARE)
            elif start_val:
                set_matrix_color(*COLOR_START)
            else:
                set_matrix_color(*COLOR_OFF)

            time.sleep(0.05)

except KeyboardInterrupt:
    print("\nStopping monitor...")
finally:
    clear_matrix()
    print("Sense HAT cleared.")
