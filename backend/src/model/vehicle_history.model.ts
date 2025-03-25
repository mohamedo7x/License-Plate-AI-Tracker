export interface VehicleHistory {
  id: number
  plate_id: number
  note?: string | null
  recorded_by?: number | null
  violation?: number | null
  license_id?: number | null
  created_at?: Date
}
