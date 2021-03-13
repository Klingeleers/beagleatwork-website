FROM jekyll/builder AS build
WORKDIR /app
COPY . .
RUN mkdir .jekyll-cache _site \
    && JEKYLL_ENV=production jekyll build --trace

FROM nginx:alpine
COPY --from=build /app/_site /usr/share/nginx/html
EXPOSE 80