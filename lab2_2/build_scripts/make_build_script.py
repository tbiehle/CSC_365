import csv

bakery_datasets = ["customers", "goods", "items", "receipts"]
katz_datasets = ["albums", "band", "instruments", "performance", "songs", "tracklists", "vocals"]
wine_datasets = ["appellations", "grapes", "wine"]

for dataset in bakery_datasets:
  with open(f"./BAKERY/BAKERY-build-{dataset}.sql", "w") as sql:
    with open(f"../Datasets CSC365/BAKERY/{dataset}.csv") as data:
      reader = csv.DictReader(data)

      for row in reader:
        try:
          val_string = ", ".join([val for val in row.values()])
        except TypeError:
          print("Error at row: ", row)
        sql.write(f"INSERT INTO {dataset.upper()} VALUES ({val_string});\n")

for dataset in katz_datasets:
  # MUST EDIT Songs.csv FOR THIS TO OUTPUT VALID SQL!!!
  # Put double quotes around "Play My Darling, Play"
  # And double every nested apostrophe! ' -> ''
  # THEN MAKE SURE TO CHECK THE SQL OUTPUT AND MAKE SURE IT'S VALID!
  with open(f"./KATZENJAMMER/KATZENJAMMER-build-{dataset}.sql", "w") as sql:
    with open(f"../Datasets CSC365/KATZENJAMMER/{dataset}.csv") as data:
      reader = csv.DictReader(data)

      for row in reader:
        try:
          val_string = ", ".join([val for val in row.values()])
        except TypeError:
          print("Error at row: ", row)
        sql.write(f"INSERT INTO {dataset.upper()} VALUES ({val_string});\n")

for dataset in wine_datasets:
  with open(f"./WINE/WINE-build-{dataset}.sql", "w") as sql:
    with open(f"../Datasets CSC365/WINE/{dataset}.csv") as data:
      reader = csv.DictReader(data)

      for row in reader:
        try:
          val_string = ", ".join([val for val in row.values()])
        except TypeError:
          print("Error at row: ", row)
        sql.write(f"INSERT INTO {dataset.upper()} VALUES ({val_string});\n")
