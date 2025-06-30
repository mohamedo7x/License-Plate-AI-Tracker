import { QueryResult, RowDataPacket } from 'mysql2'
import { getHouers } from './dateFormat.util'
import { PoliceUserRow } from '../controller/admin.controller'

export const generateDescriptionForNotification = (
  typeOfNotification: string,
  reportId: string | null = null,
) => {
  if (typeOfNotification === 'password change') {
    return 'تم تحديث كلمة المرور,يرجى تذكرها'
  } else if (typeOfNotification === 'report') {
    return 'تم الرد على آخر تقرير لك، الرجاء المتابعة.'
  }
}

type VehicleData = {
  plate: string
  classification: string
  type: string
  name: string
  description: string
  created_at: string
}

type PersonData = {
  national_id: string
  criminal_status: number
  changed: string
}
type customeType = QueryResult[] | RowDataPacket[] | undefined
export const generateUrgentCard = (
  vehicle: customeType,
  person: customeType,
) => {
  if (person && vehicle) {
    const v = vehicle[0] as VehicleData
    const p = person[0] as PersonData
    if (v && p) {
      return {
        vehicle_card: {
          urgentName: 'مركبة مطلوبة',
          palteNumber: 'رقم اللوحة ' + v.plate,
          description: `${v.classification} ${v.type} ${v.name} - مطلوبة `,
          time: getHouers(v.created_at),
        },
        person_card: {
          urgentName: 'شخص مطلوب',
          national_id: 'الرقم القومي: ' + p.national_id,
          criminal_status: p.criminal_status === 1 ? 'مطلوب' : 'غير مطلوب',
          description: 'مطلوب أمنيًا ويجري البحث عنه.',
          time: getHouers(p.changed),
        },
      }
    } else if (v && !p) {
      return {
        vehicle_card: {
          urgentName: 'مركبة مطلوبة',
          palteNumber: 'رقم اللوحة ' + v.plate,
          description: `${v.classification} ${v.type} ${v.name} - مطلوبة `,
          time: getHouers(v.created_at),
        },
      }
    } else {
      return {
        person_card: {
          urgentName: 'شخص مطلوب',
          national_id: 'الرقم القومي: ' + p.national_id,
          criminal_status: p.criminal_status === 1 ? 'مطلوب' : 'غير مطلوب',
          description: 'مطلوب أمنيًا ويجري البحث عنه.',
          time: getHouers(p.changed),
        },
      }
    }
  }
}

type TicketData = {
  violation_type: string
  vehicle_name: string
  create_at: string
  violation_action: string
  plate: string
}
type InspectedData = {
  plate: string
  brand: string
  create_at: string
  name: string
}
type WantedVehicle = {
  plate: string
  description: string
  created_at: string
}
export const generateActivitesCard = (
  ticket: customeType,
  check: customeType,
  wanted_vehicle: customeType,
) => {
  if (ticket && check) {
    const t = ticket[0] as TicketData
    const v = check[0] as InspectedData
    const w = wanted_vehicle ? (wanted_vehicle[0] as WantedVehicle) : undefined
    if (!v && !w) {
      return {
        activites_card: {
          ticket: 'مخالفة ' + t.violation_type,
          description: t.plate + t.vehicle_name,
          action: t.violation_action,
          time: getHouers(t.create_at),
        },
        inspected: {},
      }
    }
    return {
      activites_card: {
        ticket: 'مخالفة ' + t.violation_type,
        description: t.plate + t.vehicle_name,
        action: t.violation_action,
        time: getHouers(t.create_at),
      },
      inspected: {
        type: 'فحص روتيني',
        vehicle_name: v.name + ' ' + v.plate,
        status: w === undefined ? 'سليمة' : 'مطلوبة',
        time: getHouers(v.create_at),
      },
    }
  } else {
    return {}
  }
}

export const HandelViolations = (policeData:PoliceUserRow) => {
  const {} = policeData;
}
