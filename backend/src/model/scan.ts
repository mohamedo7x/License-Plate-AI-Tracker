export interface Scan {
  id: string;
  plate_id: string;
  scanned_by: string;
  latitude: number;
  longitude: number;
  timestamp?: Date;
}
