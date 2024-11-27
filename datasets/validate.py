import os
import gzip
import zipfile


def is_dblp_dataset_valid(file_path):
    if not os.path.exists(file_path):
        print(f"文件 {file_path} 不存在")
        return False

    try:
        with gzip.open(file_path, "rb") as gz:
            # 读取前几行
            lines = []
            for _ in range(5):
                line = gz.readline()
                if not line:
                    break
                lines.append(line.decode("utf-8"))

        # 打印前几行
        for line in lines:
            print(line.strip())

        print(f"文件 {file_path} 可用")
        return True
    except Exception as e:
        print(f"文件 {file_path} 无法解压缩: {e}")
        return False


def is_zip_dataset_valid(file_path):
    if not os.path.exists(file_path):
        print(f"文件 {file_path} 不存在")
        return False

    try:
        with zipfile.ZipFile(file_path, "r") as zip_ref:
            # 读取前几个文件名
            file_list = zip_ref.namelist()[:5]
            for file_name in file_list:
                print(file_name)
        print(f"文件 {file_path} 可用")
        return True
    except Exception as e:
        print(f"文件 {file_path} 无法解压缩: {e}")
        return False


def validate_datasets(datasets, save_dir):
    for name, url in datasets.items():
        file_extension = os.path.splitext(url)[1]
        if name == "DBLP":
            file_path = os.path.join(
                save_dir, f"{name.replace(' ', '_')}.xml{file_extension}"
            )
            is_dblp_dataset_valid(file_path)
        elif file_extension == ".zip" or name == "Twitter Sentiment Analysis":
            file_path = os.path.join(save_dir, f"{name.replace(' ', '_')}.zip")
            is_zip_dataset_valid(file_path)
        else:
            print(f"不支持的文件类型: {file_extension}")
