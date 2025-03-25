export interface Scan {
  id: number
  plate_id: number
  scanned_by: number
  latitude: number
  longitude: number
  timestamp?: Date
}
