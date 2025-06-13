# program edits kwinrc to alter border-color properties.
# prints out a triplet of html colors to change panel colors
# and plasma highlight color
# panel-colorizer does not update itself sadly
# look at ~/.cache/wal/colors-kitty.conf
# to check contrast between colors
# reads colors-putty.reg to get the
# RGB values for the colors
# (it also uses the UK spelling for some reason)
import os

home = os.environ["HOME"]
foreground = "foreground"  # same as cursor color for pywal
background = "background"
border = "color1"

putty_dict = {
    "foreground": "Colour0",
    "background": "Colour2",
    "cursor": "Colour5",
    "color0": "Colour6",
    "color8": "Colour7",
    "color1": "Colour8",
    "color9": "Colour9",
    "color2": "Colour10",
    "color10": "Colour11",
    "color3": "Colour12",
    "color11": "Colour13",
    "color4": "Colour14",
    "color12": "Colour15",
    "color5": "Colour16",
    "color13": "Colour17",
    "color6": "Colour18",
    "color14": "Colour19",
    "color7": "Colour20",
    "color15": "Colour21",
}
active_color_pick = putty_dict[border]
inactive_color_pick = putty_dict[foreground]

rgb_file = ".cache/wal/colors-putty.reg"
ref_file = ".cache/wal/colors-kitty.conf"


def get_theme_colors():
    cols = {}
    with open(os.path.join(home, ref_file), "r") as f:
        for line in f:
            if foreground in line:
                a = line.split()
                cols["fg"] = a[1]
            elif background in line:
                a = line.split()
                cols["bg"] = a[1]
            elif border in line:
                a = line.split()
                cols["br"] = a[1]
    return cols


def get_wal_edge_colors():
    with open(os.path.join(home, rgb_file), "r") as f:
        cols = {}
        for line in f:
            if active_color_pick in line:
                a = line.split('"')
                cols["active"] = a[3]
            elif inactive_color_pick in line:
                a = line.split('"')
                cols["inactive"] = a[3]
    return cols


def edit_kwinrc_key(file_path, active="#000000", inactive="#999999"):
    if not os.path.exists(file_path):
        print(f"File not found: {file_path}")
        return
    with open(file_path, "r") as f:
        otp = []
        for line in f:
            key = line.split("=")[0]
            if key == "InactiveOutlineColor":
                print("previous color:", line)
                otp.append("InactiveOutlineColor={}\n".format(inactive))
                print("previous color:", inactive)
            elif key == "OutlineColor":
                print("previous color:", line)
                otp.append("OutlineColor={}\n".format(active))
                print("new color:", active)
            else:
                otp.append(line)
    with open(file_path, "w") as f:
        f.write("".join(otp))


if __name__ == "__main__":
    file_path = os.path.join(home, ".config/kwinrc")
    colors = get_wal_edge_colors()
    edit_kwinrc_key(file_path, **colors)
    print(get_theme_colors())
