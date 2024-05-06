FROM registry.fedoraproject.org/fedora:40

RUN dnf install -y httpd && dnf clean all

EXPOSE 8080

RUN sed -i 's/^Listen.*/Listen 0.0.0.0:8080/' '/etc/httpd/conf/httpd.conf'

CMD ["httpd", "-D", "FOREGROUND"]
