import os
import subprocess
import sys
import time

def lint_directory(directory):
    for dirpath, _, filenames in os.walk(directory):
        for filename in filenames:
            if filename.endswith('.py'):
                file_path = os.path.join(dirpath, filename)
                subprocess.run(['pylint', file_path])
                time.sleep(2)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python lint.py directory_path")
        sys.exit(1)
    
    directory_to_lint = sys.argv[1]
    lint_directory(directory_to_lint)

