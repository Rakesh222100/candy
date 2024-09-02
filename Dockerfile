# Stage 1: Build Stage
FROM node:alpine AS build

WORKDIR /app/

COPY package*.json ./

# Install only production dependencies
RUN npm install --production

COPY . .

# Compress the Node.js binary to save space
RUN apk add --no-cache upx \
    && upx --best --lzma /usr/local/bin/node

# Stage 2: Minimal Production Stage
FROM scratch

WORKDIR /app/

# Copy only the necessary files from the build stage
COPY --from=build /app /app
COPY --from=build /usr/local/bin/node /usr/local/bin/node
COPY --from=build /lib /lib
COPY --from=build /usr/lib /usr/lib

ENTRYPOINT ["/usr/local/bin/node", "app.js"]
