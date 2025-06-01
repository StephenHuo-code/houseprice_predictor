# 使用Python 3.11 slim作为基础镜像
FROM python:3.11-slim

# 设置工作目录
WORKDIR /app

# 复制API应用文件
COPY src/api/ .

RUN pip install --no-cache-dir -r requirements.txt


# 创建models目录并复制训练好的模型文件
RUN mkdir -p /app/models/trained
COPY models/trained/ /app/models/trained/

# 暴露端口8000
EXPOSE 8000

# 设置启动命令
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]