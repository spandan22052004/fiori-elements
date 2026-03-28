// const cds = require('@sap/cds');
// const { executeHttpRequest } = require('@sap-cloud-sdk/http-client');

// module.exports = cds.service.impl(async function () {

//     const { PO } = this.entities;

//     this.on('createPO', async (req) => {

//         const { Product, Quantity, Price } = req.data;

//         // 1️⃣ Insert PO into DB
//         await cds.run(
//             INSERT.into(PO).entries({
//                 Product,
//                 Quantity,
//                 Price
//             })
//         )

//         // 2️⃣ Fetch running workflow
//         const instanceResponse = await executeHttpRequest(
//             { destinationName: 'BPA' },
//             {
//                 method: 'GET',
//                 url: `/workflow/rest/v1/workflow-instances?$filter=status eq 'RUNNING'&$orderby=startedAt desc`
//             }
//         );

//         if (!instanceResponse.data.length) {
//             return "PO Created - No Workflow Found";
//         }

//         const wfId = instanceResponse.data[0].id;

//         // 3️⃣ If price < 1000 → auto approve
//         if (Price < 1000) {

//             const taskResponse = await executeHttpRequest(
//                 { destinationName: 'BPA' },
//                 {
//                     method: 'GET',
//                     url: `/workflow/rest/v1/task-instances?workflowInstanceId=${wfId}`
//                 }
//             );

//             const taskId = taskResponse.data[0].id;

//             await executeHttpRequest(
//                 { destinationName: 'BPA' },
//                 {
//                     method: 'PATCH',
//                     url: `/workflow/rest/v1/task-instances/${taskId}`,
//                     data: {
//                         status: "COMPLETED",
//                         decision: "approve"
//                     }
//                 }
//             );

//             return "PO Created and Auto Approved";
//         }

//         // 4️⃣ If price >= 1000
//         return "PO Created - Waiting for Manual Approval";

//     });

// });