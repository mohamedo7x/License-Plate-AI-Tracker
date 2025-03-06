import { Scan } from '../../model/scan';

export interface ScanDao {
  createScan(scan: Scan): Promise<Scan>;
  findScanById(id: string): Promise<Scan | null>;
  findScansByPlateId(plateId: string): Promise<Scan[]>;
  findScansByScannerId(scannerId: string): Promise<Scan[]>;
  listAllScans(): Promise<Scan[]>;
  deleteScan(id: string): Promise<boolean>;
  countScansByPlateId(plateId: string): Promise<number>;
  listRecentScans(limit: number): Promise<Scan[]>;
}
