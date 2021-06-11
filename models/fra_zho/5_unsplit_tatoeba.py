import os
import json

with open("0b_env.json", "r", encoding="utf-8") as infile:
    CONFIG = json.loads(infile.read())

PAIR = CONFIG["pair"]
PATH_DATA = CONFIG["path_data"]

SRC_LANG_ISO1 = PAIR["src"]["iso1"]
TRG_LANG_ISO1 = PAIR["trg"]["iso1"]

SRC_LANG_ISO3 = PAIR["src"]["iso3"]
TRG_LANG_ISO3 = PAIR["trg"]["iso3"]

SRC_LANG_ISO3PLUS = PAIR["src"]["iso3plus"]
TRG_LANG_ISO3PLUS = PAIR["trg"]["iso3plus"]

iso3plus_to_1 = {
    SRC_LANG_ISO3PLUS: SRC_LANG_ISO1,
    TRG_LANG_ISO3PLUS: TRG_LANG_ISO1
}

PATH_DATA_PAIR = os.path.join(PATH_DATA, f"{SRC_LANG_ISO3}_{TRG_LANG_ISO3}")

PATH_TATOEBA_FOLDER = os.path.join(PATH_DATA_PAIR, "tatoeba-challenge")

PATH_DEV_UNSPITTED = os.path.join(PATH_TATOEBA_FOLDER, "dev.txt")
PATH_TEST_UNSPITTED = os.path.join(PATH_TATOEBA_FOLDER, "test.txt")

def unsplit_tatoeba_challenge_set(path_root: str, set_name: str):
    path_set_unsplitted = os.path.join(path_root, set_name)
    set_prefix = set_name.split(".")[0]
    path_src = os.path.join(path_root, f"{set_prefix}.{SRC_LANG_ISO1}-{TRG_LANG_ISO1}.{SRC_LANG_ISO1}.txt")
    path_trg = os.path.join(path_root, f"{set_prefix}.{SRC_LANG_ISO1}-{TRG_LANG_ISO1}.{TRG_LANG_ISO1}.txt")

    with open(path_set_unsplitted, "r") as infile_unsplitted, \
        open(path_src, "w") as outfile_splitted_src, \
        open(path_trg, "w") as outfile_splitted_trg:

        line_unsplitted = infile_unsplitted.readline()

        outfiles = {
            SRC_LANG_ISO1: outfile_splitted_src,
            TRG_LANG_ISO1: outfile_splitted_trg,
        }
        while line_unsplitted:
            line_unsplitted = line_unsplitted.rstrip("\n")
            line_splitted = line_unsplitted.split("\t")
            if (SRC_LANG_ISO3PLUS!= line_splitted[0]) or (TRG_LANG_ISO3PLUS!= line_splitted[1]):
                # Line languages not equal to requested languages
                line_unsplitted = infile_unsplitted.readline()
                continue
            
            for idx in range(2):
                target_iso3plus = line_splitted[idx]
                target_iso1 = iso3plus_to_1[target_iso3plus]
                target_line = line_splitted[idx + 2]
                outfiles[target_iso1].write(target_line + "\n")

            # everything is done, go to the next line
            line_unsplitted = infile_unsplitted.readline()

unsplit_tatoeba_challenge_set(PATH_TATOEBA_FOLDER, "dev.txt")
unsplit_tatoeba_challenge_set(PATH_TATOEBA_FOLDER, "test.txt")

print("Finished !")