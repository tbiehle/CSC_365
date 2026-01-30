import csv

bakery_datasets = ["customers", "goods", "items", "receipts"]
katz_datasets = ["albums", "band", "instruments", "performance", "songs", "tracklists", "vocals"]
wine_datasets = ["appellation", "grapes", "wine"]

print("Writing BAKERY scripts...")
for dataset in bakery_datasets:
  with open(f"./BAKERY/BAKERY-build-{dataset}.sql", "w") as sql:
    with open(f"../Datasets CSC365/BAKERY/{dataset}.csv") as data:
      reader = csv.DictReader(data)

      for row in reader:
        if dataset == "receipts":
          receipt, date, customer = row.values()
          date = date.strip()
          try:
            insert = f"INSERT INTO {dataset.upper()} VALUES ({receipt}, STR_TO_DATE({date}, \"%e-%b-%Y\"), {customer});\n"
          except TypeError:
            print("Error at row: ", row)
        else:
          try:
            val_string = ", ".join([val for val in row.values()])
          except TypeError:
            print("Error at row: ", row)
          insert = f"INSERT INTO {dataset.upper()} VALUES ({val_string});\n"

        sql.write(insert)

print("Writing WINE scripts...")
for dataset in wine_datasets:
  if dataset == "appellation":
    dataset_name = "appellations"
  else:
    dataset_name = dataset
  with open(f"./WINE/WINE-build-{dataset}.sql", "w") as sql:
    with open(f"../Datasets CSC365/WINE/{dataset_name}.csv") as data:
      reader = csv.DictReader(data)
      for row in reader:
        try:
          val_string = ", ".join([val for val in row.values()])
        except TypeError:
          print("Error at row: ", row)
        sql.write(f"INSERT INTO {dataset.upper()} VALUES ({val_string});\n")

print("Writing KATZENJAMMER scripts...")
for dataset in katz_datasets:
  with open(f"./KATZENJAMMER/KATZENJAMMER-build-{dataset}.sql", "w") as sql:
    with open(f"../Datasets CSC365/KATZENJAMMER/{dataset}.csv") as data:
      data.readline() # skip first line of CSV
      for row in data:
        row = row.strip()
        if dataset == "songs":  # special formatting 
          song_id, title = row.split(",", 1)
          title = title.strip("'")
          title = title.replace("'", "''")
          insert = f"{song_id}, '{title}'"
        else:
          insert = row

        sql.write(f"INSERT INTO {dataset.upper()} VALUES ({insert});\n")

print("All scripts written succesfully.")