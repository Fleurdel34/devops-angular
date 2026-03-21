# Stage 1: Build the Angular Application

FROM node:20-slim AS build 
WORKDIR /app

COPY package.json package-lock.json* ./
RUN --mount=type=cache,target=/root/.npm npm ci

COPY . .
RUN npm run build 

# Stage 2: Prepare Nginx to Serve Static Files

FROM nginx:1.27-alpine

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist/olympic-games-starter/browser /app

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]