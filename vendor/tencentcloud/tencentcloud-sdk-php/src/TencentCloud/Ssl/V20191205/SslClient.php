<?php
/*
 * Copyright (c) 2017-2018 THL A29 Limited, a Tencent company. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

namespace TencentCloud\Ssl\V20191205;

use TencentCloud\Common\AbstractClient;
use TencentCloud\Common\Profile\ClientProfile;
use TencentCloud\Common\Credential;
use TencentCloud\Ssl\V20191205\Models as Models;

/**
 * @method Models\ApplyCertificateResponse ApplyCertificate(Models\ApplyCertificateRequest $req) 本接口（ApplyCertificate）用于免费证书申请。
 * @method Models\CancelCertificateOrderResponse CancelCertificateOrder(Models\CancelCertificateOrderRequest $req) 取消证书订单。
 * @method Models\CommitCertificateInformationResponse CommitCertificateInformation(Models\CommitCertificateInformationRequest $req) 提交证书订单。
 * @method Models\DeleteCertificateResponse DeleteCertificate(Models\DeleteCertificateRequest $req) 本接口（DeleteCertificate）用于删除证书。
 * @method Models\DescribeCertificateResponse DescribeCertificate(Models\DescribeCertificateRequest $req) 本接口（DescribeCertificate）用于获取证书信息。
 * @method Models\DescribeCertificateDetailResponse DescribeCertificateDetail(Models\DescribeCertificateDetailRequest $req) 获取证书详情。
 * @method Models\DescribeCertificateOperateLogsResponse DescribeCertificateOperateLogs(Models\DescribeCertificateOperateLogsRequest $req) 获取用户账号下有关证书的操作日志。
 * @method Models\DescribeCertificatesResponse DescribeCertificates(Models\DescribeCertificatesRequest $req) 本接口（DescribeCertificates）用于获取证书列表。
 * @method Models\DownloadCertificateResponse DownloadCertificate(Models\DownloadCertificateRequest $req) 本接口（DownloadCertificate）用于下载证书。
 * @method Models\ModifyCertificateAliasResponse ModifyCertificateAlias(Models\ModifyCertificateAliasRequest $req) 用户传入证书id和备注来修改证书备注。
 * @method Models\ModifyCertificateProjectResponse ModifyCertificateProject(Models\ModifyCertificateProjectRequest $req) 批量修改证书所属项目。
 * @method Models\ReplaceCertificateResponse ReplaceCertificate(Models\ReplaceCertificateRequest $req) 本接口（ReplaceCertificate）用于重颁发证书。已申请的免费证书仅支持 RSA 算法、密钥对参数为2048的证书重颁发，并且目前仅支持1次重颁发。
 * @method Models\SubmitCertificateInformationResponse SubmitCertificateInformation(Models\SubmitCertificateInformationRequest $req) 提交证书资料。
 * @method Models\UploadCertificateResponse UploadCertificate(Models\UploadCertificateRequest $req) 本接口（UploadCertificate）用于上传证书。
 */

class SslClient extends AbstractClient
{
    /**
     * @var string
     */
    protected $endpoint = "ssl.tencentcloudapi.com";

    /**
     * @var string
     */
    protected $version = "2019-12-05";

    /**
     * @param Credential $credential
     * @param string $region
     * @param ClientProfile|null $profile
     * @throws TencentCloudSDKException
     */
    function __construct($credential, $region, $profile=null)
    {
        parent::__construct($this->endpoint, $this->version, $credential, $region, $profile);
    }

    public function returnResponse($action, $response)
    {
        $respClass = "TencentCloud"."\\".ucfirst("ssl")."\\"."V20191205\\Models"."\\".ucfirst($action)."Response";
        $obj = new $respClass();
        $obj->deserialize($response);
        return $obj;
    }
}
