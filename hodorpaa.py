
import os
from os import listdir
import sys
import argparse
import glob

class ArgOptions:
    pass

arg_options = ArgOptions()

def parse_args(argv=sys.argv[1:]):
    parser = argparse.ArgumentParser(description="My Python script.")

    # Use the arg_* snippets to add arguments
    parser.add_argument("from_type", type=str,
                        help="From file type.")
    parser.add_argument("to_type", type=str,
                        help="To file type.")
    parser.add_argument("file_pattern", type=str,
                        help="Either a partial string for the file(s), the exact filename, or * for everything.")
    parser.add_argument("from_path", type=str,
                        help="Where the source files are.")
    parser.add_argument("to_path", type=str,
                        help="Where the source files are.")
    parser.parse_args(namespace=arg_options)


    return arg_options


opt = ArgOptions()
opt = parse_args()

cwd_name = os.getcwd()

search_pattern = ""

if(opt.file_pattern == ""):
    # do everything
    search_pattern = "*." + opt.from_type
else:
    # use a pattern
    search_pattern = opt.file_pattern + "." + opt.from_type

os.chdir(opt.from_path)
from_file_names = glob.glob(search_pattern)

for file in from_file_names:
    print(os.getcwd())
    base_filename, base_extension = file.split(".")
    command_string_template = '"E:\\SteamLibrary\\steamapps\\common\\Arma 3 Tools\\ImageToPAA\\ImageToPAA.exe" {0}{1}.{2} {3}{1}.{4}'
    command_string = command_string_template.format(opt.from_path,
                                                    base_filename,
                                                    opt.from_type,
                                                    opt.to_path,
                                                    opt.to_type)
    #print(command_string)
    os.system(command_string)

    #python hodorpaa.py paa png * C:\Users\justi\source\repos\hodorpaa\images\ C:\Users\justi\source\repos\hodorpaa\





