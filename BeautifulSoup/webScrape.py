<<<<<<< HEAD
from bs4 import BeautifulSoup
import requests
import csv

source = requests.get("http://coreyms.com").text

soup = BeautifulSoup(source, "lxml")

#print(soup.prettify())

article = soup.find("article")
#print(article.prettify())

headline = article.h2.a.text
#print(headline)

summary = article.find("div", class_="entry-content").p.text
#print(summary)

vid_src = article.find("iframe", class_="youtube-player")["src"]  # like dict
#print(vid_src)

vid_id = vid_src.split("/")[4]
#print(vid_id)
vid_id = vid_id.split("?")[0]
#print(vid_id)

yt_link = f"https://youtube.com/watch?v={vid_id}"  # format
#print(yt_link)

csv_file = open("webScrape.csv", "w")

csv_writer = csv.writer(csv_file)
csv_writer.writerow(["headline", "summary", "video_link"])

for article in soup.find_all("article"):
    headline = article.h2.a.text
    print(headline)

    summary = article.find("div", class_="entry-content").p.text
    print(summary)

    try:
        vid_src = article.find("iframe", class_="youtube-player")["src"]  # like dict
        vid_id = vid_src.split("/")[4]
        vid_id = vid_id.split("?")[0]
        yt_link = f"https://youtube.com/watch?v={vid_id}"  # format
    except Exception as e:
        yt_link = None
    print(yt_link)

    print()

    csv_writer.writerow([headline, summary, yt_link])

=======
from bs4 import BeautifulSoup
import requests
import csv

source = requests.get("http://coreyms.com").text

soup = BeautifulSoup(source, "lxml")

#print(soup.prettify())

article = soup.find("article")
#print(article.prettify())

headline = article.h2.a.text
#print(headline)

summary = article.find("div", class_="entry-content").p.text
#print(summary)

vid_src = article.find("iframe", class_="youtube-player")["src"]  # like dict
#print(vid_src)

vid_id = vid_src.split("/")[4]
#print(vid_id)
vid_id = vid_id.split("?")[0]
#print(vid_id)

yt_link = f"https://youtube.com/watch?v={vid_id}"  # format
#print(yt_link)

csv_file = open("webScrape.csv", "w")

csv_writer = csv.writer(csv_file)
csv_writer.writerow(["headline", "summary", "video_link"])

for article in soup.find_all("article"):
    headline = article.h2.a.text
    print(headline)

    summary = article.find("div", class_="entry-content").p.text
    print(summary)

    try:
        vid_src = article.find("iframe", class_="youtube-player")["src"]  # like dict
        vid_id = vid_src.split("/")[4]
        vid_id = vid_id.split("?")[0]
        yt_link = f"https://youtube.com/watch?v={vid_id}"  # format
    except Exception as e:
        yt_link = None
    print(yt_link)

    print()

    csv_writer.writerow([headline, summary, yt_link])

>>>>>>> daf32582d1a0a0d4fb6443307e6a8017efbf815c
csv_file.close()