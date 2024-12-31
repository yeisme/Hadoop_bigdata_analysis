import subprocess
import os


def extract_file(file_path, output_dir):
    """
    使用 7z 解压文件
    :param file_path: 要解压的文件路径
    :param output_dir: 解压后的输出目录
    """
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    try:
        subprocess.run(["7z", "x", file_path, f"-o{output_dir}"], check=True)
        print(f"文件 {file_path} 解压成功到 {output_dir}")
    except subprocess.CalledProcessError as e:
        print(f"解压文件 {file_path} 失败: {e}")


if __name__ == "__main__":
    base_path = "datasets"
    base_output = "output"

    datasets = [
        ("DBLP.xml.gz", "DBLP"),
        ("ImageNet.zip", "ImageNet"),
        ("forest.zip", "forest"),
    ]

    for file_name, output_subdir in datasets:
        file_path = os.path.join(base_path, file_name)
        output_dir = os.path.join(base_output, output_subdir)

        extract_file(file_path, output_dir)
