import os
import requests
from .validate import validate_datasets
from . import datasets


def download_dataset(name, url, save_path):
    response = requests.get(url, stream=True)
    if response.status_code == 200:
        with open(save_path, "wb") as f:
            for chunk in response.iter_content(chunk_size=1024):
                if chunk:
                    f.write(chunk)
        print(f"{name} 下载完成，保存路径: {save_path}")
    else:
        print(f"下载 {name} 失败，状态码: {response.status_code}")


def download_all_datasets(datasets, save_dir):
    if not os.path.exists(save_dir):
        os.makedirs(save_dir)

    for name, url in datasets.items():
        file_extension = os.path.splitext(url)[1]
        if name == "DBLP":
            save_path = os.path.join(
                save_dir, f"{name.replace(' ', '_')}.xml{file_extension}"
            )
        elif file_extension == "":
            save_path = os.path.join(save_dir, f"{name.replace(' ', '_')}.zip")
        else:
            save_path = os.path.join(
                save_dir, f"{name.replace(' ', '_')}{file_extension}"
            )

        # 如果文件已经存在，跳过下载
        if os.path.exists(save_path):
            print(f"{name} 已经存在，跳过下载")
            continue

        download_dataset(name, url, save_path)


if __name__ == "__main__":
    save_directory = "datasets"

    download_all_datasets(datasets, save_directory)

    validate_datasets(datasets, save_directory)
