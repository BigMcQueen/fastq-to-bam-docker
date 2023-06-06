# fastq-to-bam-docker
## Project Title
FASTQデータをBAMファイルにするためのツールが詰まったDockerコンテナを作成できます。
## Getting Started
### Prerequisites
- Docker
- Terminal or WSL
### Installing
作業フォルダをつくり、フォルダに移動します。
   
   
    mkdir workspace
   
    cd workspace
   
   
作業フォルダにDockerfile, docker-compose.ymlを置き、以下のコマンドを実行します。
　  
   
`docker compose up -d --build`
   
   
成功すると以下のように表示されます。
   
    [+] Building 176.6s (18/18) FINISHED
     => [seq internal] load build definition from Dockerfile                                                                               0.0s
     => => transferring dockerfile: 970B                                                                                                   0.0s
     => [seq internal] load .dockerignore                                                                                                  0.0s
     => => transferring context: 2B                                                                                                        0.0s
     => [seq internal] load metadata for docker.io/library/ubuntu:20.04                                                                    4.9s
     => [seq  1/14] FROM docker.io/library/ubuntu:20.04@sha256:db8bf6f4fb351aa7a26e27ba2686cf35a6a409f65603e59d4c203e58387dc6b3            3.3s
     => => resolve docker.io/library/ubuntu:20.04@sha256:db8bf6f4fb351aa7a26e27ba2686cf35a6a409f65603e59d4c203e58387dc6b3                  0.0s
     => => sha256:db8bf6f4fb351aa7a26e27ba2686cf35a6a409f65603e59d4c203e58387dc6b3 1.13kB / 1.13kB                                         0.0s
     => => sha256:144e6a778925a0c11c4cd9fe5fce1172e620f215b0410bb43e7fa41bbcfe4522 424B / 424B                                             0.0s
     => => sha256:758cd4ebb2178eb0cd2ce78dea8ffad569f5bba415c4b33b694e891e7697e854 2.32kB / 2.32kB                                         0.0s
     => => sha256:8659cf1709ef03be2c0b2dc339b19432bff8a0753d2d7d53f47272f098f56ef4 25.97MB / 25.97MB                                       2.5s
     => => extracting sha256:8659cf1709ef03be2c0b2dc339b19432bff8a0753d2d7d53f47272f098f56ef4                                              0.7s
     => [seq  2/14] RUN ln -snf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && echo Asia/Tokyo > /etc/timezone                           0.2s
     => [seq  3/14] RUN apt update && apt install -y     wget     curl     vim     default-jre     hisat2     build-essential     libnc  136.4s
     => [seq  4/14] WORKDIR /opt                                                                                                           0.0s
     => [seq  5/14] RUN wget --no-check-certificate http://opengene.org/fastp/fastp                                                        3.9s
     => [seq  6/14] RUN chmod a+x /opt/fastp && ln -s /opt/fastp /usr/local/bin/fastp                                                      0.3s
     => [seq  7/14] RUN wget --no-check-certificate https://github.com/samtools/samtools/releases/download/1.15.1/samtools-1.15.1.tar.bz2  2.3s
     => [seq  8/14] RUN tar -xvf samtools-1.15.1.tar.bz2 && rm -rf samtools-1.15.1.tar.bz2                                                 1.0s
     => [seq  9/14] WORKDIR /opt/samtools-1.15.1/                                                                                          0.0s
     => [seq 10/14] RUN ./configure --prefix=/usr/local/                                                                                   3.0s
     => [seq 11/14] RUN make -j12 && make install                                                                                         11.7s
     => [seq 12/14] WORKDIR /opt/samtools-1.15.1/htslib-1.15.1/                                                                            0.0s
     => [seq 13/14] RUN make -j && make install                                                                                            7.9s
     => [seq 14/14] WORKDIR /work                                                                                                          0.0s
     => [seq] exporting to image                                                                                                           1.9s
     => => exporting layers                                                                                                                1.8s
     => => writing image sha256:ea88c03cd3cbd41c39e61a605920cd6719ad5903c956dadf5f5580b51317450d                                           0.0s
     => => naming to docker.io/library/fastq-to-bam-docker-seq                                                                             0.0s
    [+] Running 2/2
     ✔ Network fastq-to-bam-docker_default  Created                                                                                        0.0s
     ✔ Container seq                        Started                                                                                        0.2s
     => => transferring context: 2B                                                                                                        0.0s
### Tools
##### `fastp` FASTQデータからアダプターをトリミングしたり、不必要なリードをフィルタリングできます。
   
参考：https://kazumaxneo.hatenablog.com/entry/2018/05/21/111947
   
##### `hisat2` FASTQデータをリファレンス配列にマッピングし、SAMファイルを生成できます。
   
参考：https://kazumaxneo.hatenablog.com/entry/2018/03/21/171900
   
##### `samtools` SAMファイルをBAMファイルに変換したり、BAMファイルの中身をソートしたり、BAMファイルからインデックスファイルを生成したりできます。
   
参考：https://cell-innovation.nig.ac.jp/SurfWiki/SAMtools.html
　　　
## License
This project is licensed under the MIT License
