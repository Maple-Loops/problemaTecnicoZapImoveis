import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import os


def send_email(smtp_server, smtp_port, smtp_user, smtp_password, fromaddr, toaddr, subject, body, files):
    msg = MIMEMultipart()
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Subject'] = subject

    msg.attach(MIMEText(body, 'plain'))

    for file in files:
        attachment = open(file, "rb")

        part = MIMEBase('application', 'octet-stream')
        part.set_payload(attachment.read())
        encoders.encode_base64(part)
        part.add_header('Content-Disposition', f"attachment; filename= {os.path.basename(file)}")

        msg.attach(part)

    server = smtplib.SMTP(smtp_server, smtp_port)
    server.starttls()
    server.login(smtp_user, smtp_password)
    text = msg.as_string()
    server.sendmail(fromaddr, toaddr, text)
    server.quit()


if __name__ == "__main__":
    smtp_server = 'smtp.gmail.com'
    smtp_port = 587
    smtp_user = 'emailteste@teste.com'
    smtp_password = 'senha'
    fromaddr = 'emailteste@teste.com'
    toaddr = 'emailteste@teste.com'
    subject = "Resultados dos Testes Automatizados"
    body = "Encontre em anexo os resultados dos testes automatizados."
    files = ["problemaTecnicoZapImoveis/tests/result/output.xml", "problemaTecnicoZapImoveis/tests/result/report.html", "problemaTecnicoZapImoveis/tests/result/log.html"]

    send_email(smtp_server, smtp_port, smtp_user, smtp_password, fromaddr, toaddr, subject, body, files)
