FROM lambci/lambda:build-python3.7

RUN pip install -t /opt/python/ requests
RUN yum install -y yum-utils rpmdevtools wget
RUN wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox-0.12.5-1.centos7.x86_64.rpm
RUN wget http://download-ib01.fedoraproject.org/pub/fedora/linux/releases/29/Everything/x86_64/os/Packages/l/libpng15-1.5.30-6.fc29.x86_64.rpm
RUN rpmdev-extract *rpm
RUN mv wkhtmltox*/usr/local/* /opt
RUN mv libpng*/usr/lib64/* /opt/lib/
RUN rm -rf libpng* wkh*
RUN rm -rf libpng* wkh*

COPY pdf_report_test/requirements.txt requirements.txt
RUN pip install -t /opt/python/ -r requirements.txt

RUN rm -rf /opt/include /opt/share
RUN rm -rf /opt/lib/libwkhtmltox.so /opt/lib/libwkhtmltox.so.0 /opt/lib/libwkhtmltox.so.0.12 /opt/lib/libpng15.so.15
RUN mv /opt/lib/libwkhtmltox.so.0.12.5 /opt/lib/libwkhtmltox.so
RUN mv /opt/lib/libpng15.so.15.30.0 /opt/lib/libpng15.so.15
WORKDIR /var/task