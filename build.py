import os
import json
import time

# Configuration
img_dir = os.path.join(os.path.dirname(__file__), 'Img')
output_file = os.path.join(os.path.dirname(__file__), 'images.json')

def build():
    if not os.path.exists(img_dir):
        print(f"Error: Directory '{img_dir}' not found.")
        return False

    images = []
    supported_exts = ('.png', '.jpg', '.jpeg', '.gif', '.webp', '.svg')
    
    for filename in os.listdir(img_dir):
        if filename.lower().endswith(supported_exts):
            filepath = os.path.join(img_dir, filename)
            stats = os.stat(filepath)
            
            images.append({
                "name": filename,
                "size": f"{stats.st_size / (1024 * 1024):.2f} MB",
                "lastModified": stats.st_mtime * 1000  # JS expects milliseconds
            })
    
    with open(output_file, 'w') as f:
        json.dump(images, f, indent=2)
    
    print(f"Successfully generated {output_file} with {len(images)} images.")
    return True

if __name__ == "__main__":
    build()
