# README

バーチャルキャスト上で撮った写真をインスタントカメラやチェキのようにVR内ですぐに取り出す体験のコンセプト検証用のコードです。PoC向けのコードなので汎用的に利用できる状態ではありません。

## 写真のアップロード

### 任意の写真を1枚アップ

```bash
ruby pic-uploader.rb mypic.png
```

### 最新の写真を1枚アップ

```bash
ruby pic-uploader.rb
```

### 最新の写真を随時アップ

```bash
ruby pic-uploader.rb serve
```

## VCIのアップロード

```bash
ruby vci-uploader.rb ~/download/slide\ \(83\).vci
```
