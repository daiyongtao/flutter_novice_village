
/// 图片模型
class ImageOption {
  /// 名称
  final String name;
  /// 图片资源
  final String src;
  /// 每次点击时：增加的最小功德数值
  final int min;
  /// 每次点击时：增加的最大功德数值
  final int max;

  const ImageOption(this.name, this.src, this.min, this.max);
}