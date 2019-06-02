from bs4 import BeautifulSoup
import requests

with open("simple.html") as html_file:
    soup = BeautifulSoup(html_file, "lxml")

#print(soup.prettify())  # print out formatted soup

match = soup.title.text
#print(match)  # print title

match = soup.div
#print(match)  # print first div tag

match = soup.find("div", class_="footer")
#print(match)  # print footer

article = soup.find("div", class_="article")
#print(article)  # print first article

headline = article.h2.a.text
#print(headline)

summary = article.p.text
#print(summary)

for article in soup.find_all("div", class_="article"):  # print all articles
    headline = article.h2.a.text
    print(headline)

    summary = article.p.text
    print(summary)

    print()
