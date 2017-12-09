from selenium import webdriver
from selenium.webdriver import Chrome
from selenium.webdriver.chrome.options import Options
from bs4 import BeautifulSoup as bs4
import time

class JobCan:
    def __init__(self):
        self.options = Options()
        self.options.add_argument('--headless')
        self.options.add_argument('--window-size=1920,1080')
        self.driver = webdriver.Chrome(chrome_options=self.options)

    def open_url(self, url):
        self.driver.get(url)

    def click_page(self, sleep_seconds = 0):
        self.driver.find_element_by_name('client_id').send_keys('会社ID')
        self.driver.find_element_by_name('email').send_keys('メールアドレス')
        self.driver.find_element_by_name('password').send_keys('パスワード')
        self.driver.find_element_by_css_selector('.btn-block').click()
        # ページ描画終わるまでスリープ
        time.sleep(sleep_seconds)
        self.data = self.driver.page_source.encode('utf-8')
        self.driver.save_screenshot('my_page.png')
        self.driver.quit()

    def scrape_page(self):
        html = bs4(self.data, 'html.parser')
        work_hours = html.find(id='monthly_summary_information').find('p').string
        print(work_hours)
        mistakes = html.select('#top_info_area > table > tbody > tr')
        for m in mistakes:
            print(m.find('th').string, m.find('a').string)

if __name__ == '__main__':
    driver = JobCan()
    driver.open_url('https://ssl.jobcan.jp/login/pc-employee/')
    driver.click_page(sleep_seconds = 10)
    driver.scrape_page()
