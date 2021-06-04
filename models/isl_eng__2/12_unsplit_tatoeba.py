import os

SRC_LANG = "is"
TRG_LANG = "en"

iso3_to_1 = {
    "isl": "is",
    "eng": "en"
}

PATH_DATA_ROOT="/home/wran/data/isl_eng/tatoeba-challenge"

PATH_DEV_UNSPITTED = os.path.join(PATH_DATA_ROOT, "dev.txt")
PATH_TEST_UNSPITTED = os.path.join(PATH_DATA_ROOT, "test.txt")

def unsplit_tatoeba_challenge_set(path_root: str, set_name: str):
    path_set_unsplitted = os.path.join(path_root, set_name)
    set_prefix = set_name.split(".")[0]
    path_src = os.path.join(path_root, f"{set_prefix}.{SRC_LANG}-{TRG_LANG}.{SRC_LANG}.txt")
    path_trg = os.path.join(path_root, f"{set_prefix}.{SRC_LANG}-{TRG_LANG}.{TRG_LANG}.txt")

    with open(path_set_unsplitted, "r") as infile_unsplitted, \
        open(path_src, "w") as outfile_splitted_src, \
        open(path_trg, "w") as outfile_splitted_trg:

        line_unsplitted = infile_unsplitted.readline()

        outfiles = {
            SRC_LANG: outfile_splitted_src,
            TRG_LANG: outfile_splitted_trg,
        }


        while line_unsplitted:
            line_unsplitted = line_unsplitted.rstrip("\n")
            line_splitted = line_unsplitted.split("\t")

            for idx in range(2):

                target_iso3 = line_splitted[idx]
                target_iso1 = iso3_to_1[target_iso3]
                target_line = line_splitted[idx + 2]
                outfiles[target_iso1].write(target_line + "\n")

            # everything is done, go to the next line
            line_unsplitted = infile_unsplitted.readline()

unsplit_tatoeba_challenge_set(PATH_DATA_ROOT, "dev.txt")
unsplit_tatoeba_challenge_set(PATH_DATA_ROOT, "test.txt")

print("Finished !")