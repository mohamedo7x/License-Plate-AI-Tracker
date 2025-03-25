export interface Violation {
    id: number;
    scan_id: number;
    violation_type: string;
    penalty_amount: number;
    status?: string | null;
    is_stolen?: boolean;
    reported_by: number;
    license_id?: number | null;
    notes?: string | null;
    evidence_url?: string | null;
    created_at?: Date;
    updated_at?: Date;
  }
  