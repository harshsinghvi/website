FROM insomniaccoder/jekyll-dev as site-builder
ADD . /app
WORKDIR /app
RUN bundle
RUN bundle jekyll build 

FROM httpd 
COPY --from=site-builder /app/_site /var/www/html
RUN servie apache2 reload 

EXPOSE 80,443