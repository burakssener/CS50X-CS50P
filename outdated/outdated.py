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
        day = day[0]
        for _ in range(len(months)):
            if months[_] == month:
                month = _ + 1
            else:
                continue
    print(f"{year:0004}-{month:02}-{day:02}")


