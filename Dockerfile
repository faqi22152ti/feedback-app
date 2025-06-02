FROM nginx:alpine
<<<<<<< HEAD

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80
=======
COPY app/index.html /usr/share/nginx/html/index.html
EXPOSE 80

>>>>>>> 769be9c (init feedback app with pipeline, dockerfile, and test)
