export enum ViolationStatus {
  Pending = 'Pending',
  UnderInvestigation = 'Under Investigation',
  Resolved = 'Resolved',
  Escalated = 'Escalated',
  Dismissed = 'Dismissed',
  Overdue = 'Overdue',
  Appealed = 'Appealed',
  CourtProceedings = 'Court Proceedings',
  Paid = 'Paid',
  PartiallyPaid = 'Partially Paid',
}

export interface Violation {
  id: string;
  scan_id: string;
  violation_type: string;
  penalty_amount: number;
  status?: ViolationStatus;
  is_stolen?: boolean;
  reported_by: string;
  license_id?: string;
  notes?: string;
  evidence_url?: string;
  created_at?: Date;
  updated_at?: Date;
}
