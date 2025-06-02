export function getImageExtension(arrayBuffer: ArrayBuffer) {
  const arr = new Uint8Array(arrayBuffer)

  if (
    arr[0] === 0x89 &&
    arr[1] === 0x50 &&
    arr[2] === 0x4e &&
    arr[3] === 0x47
  ) {
    return 'png'
  }
  if (arr[0] === 0xff && arr[1] === 0xd8 && arr[2] === 0xff) {
    return 'jpg'
  }
  if (arr[0] === 0x47 && arr[1] === 0x49 && arr[2] === 0x46) {
    return 'gif'
  }
  if (arr[0] === 0x42 && arr[1] === 0x4d) {
    return 'bmp'
  }
  if (
    arr[0] === 0x52 &&
    arr[1] === 0x49 &&
    arr[2] === 0x46 &&
    arr[3] === 0x46 &&
    arr[8] === 0x57 &&
    arr[9] === 0x45 &&
    arr[10] === 0x42 &&
    arr[11] === 0x50
  ) {
    return 'webp'
  }
  return 'bin'
}
