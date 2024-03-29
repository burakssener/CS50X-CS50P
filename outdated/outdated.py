months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
]
while True:
    raw_date = input("Date: ").strip()
    try:
        month, day, year = raw_date.split("/")
    except ValueError:
        month, day, year = raw_date.split(" ")
        if ',' in day:
            day = day.replace(",", "")
        else:
            continue
        month = month.lower().title()
        for _ in range(len(months)):
            if months[_] == month:
                month = _ + 1
            else:
                continue
    try:
        day, month, year = int(day), int(month), int(year)
        if not (31 >= day >= 0 and 12 >= month >= 0):
            continue
    except ValueError:
        continue
    print(f"{year:04}-{month:02}-{day:02}")
    break


