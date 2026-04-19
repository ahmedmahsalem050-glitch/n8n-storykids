FROM alpine:3.19 AS ffmpeg-builder
RUN apk add --no-cache ffmpeg

FROM n8nio/n8n:latest
USER root
COPY --from=ffmpeg-builder /usr/bin/ffmpeg /usr/bin/ffmpeg
COPY --from=ffmpeg-builder /usr/bin/ffprobe /usr/bin/ffprobe
COPY --from=ffmpeg-builder /usr/lib/libav* /usr/lib/
COPY --from=ffmpeg-builder /usr/lib/libsw* /usr/lib/
COPY --from=ffmpeg-builder /usr/lib/libpostproc* /usr/lib/
USER node
