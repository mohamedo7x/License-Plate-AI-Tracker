import dayjs from 'dayjs'
import 'dayjs/locale/ar'
import advancedFormat from 'dayjs/plugin/advancedFormat'

dayjs.extend(advancedFormat)
dayjs.locale('ar')

export const formatDate = (dateString: string): string => {
  return dayjs(dateString).format('D MMMM YYYY')
}
