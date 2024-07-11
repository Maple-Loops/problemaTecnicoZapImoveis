from webdriver_manager.chrome import ChromeDriverManager

def get_chrome_driver():
    path = ChromeDriverManager().install()
    return path