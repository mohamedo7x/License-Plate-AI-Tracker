import React from 'react';
import { Bar, Pie, Line } from "react-chartjs-2";
import {
    Chart as ChartJS,
    CategoryScale,
    LinearScale,
    BarElement,
    Title,
    Tooltip,
    Legend,
    ArcElement,
    PointElement,
    LineElement,
} from "chart.js";
import { useTranslation } from 'react-i18next';

ChartJS.register(
    CategoryScale,
    LinearScale,
    BarElement,
    Title,
    Tooltip,
    Legend,
    ArcElement,
    PointElement,
    LineElement
);

export default function Home() {

    const {t, i18n} = useTranslation();

    // ====== statistics-data ====== //

    const statisticsData = [

        {id: 1, title: 'totalViolationsWord', rate: 12.5, rateUp: true, num: 2547},
        {id: 2, title: 'detectedViolationsWord', rate: 8.2, rateUp: true, num: 1923},
        {id: 3, title: 'underInvestigationWord', rate: 3.1, rateUp: false, num: 624}

    ];

    // ====== charts-data ====== //

    const pieData = {

        labels: [t("detectedWord"), t("underDetectedWord")],

        datasets: [
            {
                data: [70, 30],
                backgroundColor: ["#305FA2", "#dee2e6"],
            },
        ],

    };

    const barData = {

        labels: [t("janMonth"), t("febMonth"), t("marMonth"), t("aprMonth"), t("mayMonth"), t("junMonth")],

        datasets: [
            {
                label: t("correctReportsWord"),
                data: [80, 60, 75, 85, 90, 70],
                backgroundColor: "#305FA2",
            },
            {
                label: t("falseReportsWord"),
                data: [20, 40, 25, 15, 10, 30],
                backgroundColor: "#dee2e6",
            },
        ],

    };

    const lineData = {

        labels: [t("janMonth"), t("febMonth"), t("marMonth"), t("aprMonth"), t("mayMonth"), t("junMonth")],

        datasets: [
            {
                label: t("violationsWord"),
                data: [50, 60, 80, 90, 70, 60],
                borderColor: "#305FA2",
                backgroundColor: "rgba(65, 105, 225, 0.2)",
                fill: true,
            },
        ],

    };

    const lineOptions = {
        responsive: true,
        maintainAspectRatio: false,
    };

    return <React.Fragment>

        <section className='w-full flex flex-col gap-5'>

            <div className='w-full grid grid-cols-3 gap-5'>

                {statisticsData.map(sta => <div key={sta.id} className='
                    p-5 rounded-md bg-[var(--white-color)] shadow-[0_0px_10px_var(--gray-color-3)]
                    flex flex-col gap-2.5
                '>

                    <div className='w-full flex items-center justify-between'>
                        <p className='text-base font-medium text-[var(--black-color)]'>{t(sta.title)}</p>
                        <p className={`
                            text-base font-normal ${sta.rateUp ? 'text-[var(--green-color)]' : 'text-[var(--red-color)]'}
                        `}>
                            {i18n.language === 'en' && `${sta.rateUp ? '+' : '-'}${sta.rate}%`}
                            {i18n.language === 'ar' && `${sta.rate}%${sta.rateUp ? '+' : '-'}`}
                        </p>
                    </div>

                    <h3 className='text-4xl font-medium'>{sta.num}</h3>

                    <p className='text-sm font-normal text-[var(--gray-color-2)]'>{t('lastDaysWord')}</p>

                </div>)}

            </div>

            <div className='w-full grid grid-cols-2 gap-5'>

                <div className='
                    p-5 rounded-md bg-[var(--white-color)] shadow-[0_0px_10px_var(--gray-color-3)]
                    flex flex-col gap-2.5
                '>

                    <h3 className="text-3xl font-medium mb-2">{t('violationsDistributionWord')}</h3>

                    <div className='max-h-80 m-auto'>
                        <Pie data={pieData} />
                    </div>

                </div>

                <div className='
                    p-5 rounded-md bg-[var(--white-color)] shadow-[0_0px_10px_var(--gray-color-3)]
                    flex flex-col gap-2.5
                '>

                    <h3 className="text-3xl font-medium mb-2">{t('reportAccuracyWord')}</h3>

                    <div className='w-full m-auto'>
                        <Bar data={barData} />
                    </div>

                </div>

                <div className='
                    p-5 rounded-md bg-[var(--white-color)] shadow-[0_0px_10px_var(--gray-color-3)]
                    flex flex-col gap-2.5 col-span-2
                '>

                    <h3 className="text-3xl font-medium mb-2">{t('violationTrendsWord')}</h3>

                    <div className='w-full h-80 m-auto'>
                        <Line data={lineData} options={lineOptions} />
                    </div>

                </div>

            </div>

        </section>

    </React.Fragment>

}
