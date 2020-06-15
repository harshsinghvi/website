FROM insomniaccoder/jekyll-dev as site-builder
ADD . /app
WORKDIR /app 
RUN git init 
RUN bundle
RUN bundle exec jekyll build

FROM httpd 
COPY --from=site-builder /app/_site/ /usr/local/apache2/htdocs/ 
ENV ServerName=localhost

# RUN service httpd reload 
