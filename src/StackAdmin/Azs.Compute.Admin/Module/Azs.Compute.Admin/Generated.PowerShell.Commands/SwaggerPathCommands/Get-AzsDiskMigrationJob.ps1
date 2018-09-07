<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.

Code generated by Microsoft (R) PSSwagger
Changes may cause incorrect behavior and will be lost if the code is regenerated.
#>

<#
.SYNOPSIS
	Returns the list of managed disk migration jobs.

.DESCRIPTION
    Returns a list of disk migration jobs.

.PARAMETER ResourceId
    The resource id.

.PARAMETER Status
    The parameters of disk migration job status.

.PARAMETER Location
    Location of the resource.

.PARAMETER Name
    The migration job guid name.

.EXAMPLE
    PS C:\> $migration = Get-AzsDiskMigrationJob -location local -Name "mymigrationName"

    Get a specific managed disk migration job.

.EXAMPLE
    PS C:\> $migration = Get-AzsDiskMigrationJob -location local

    Returns a list of managed disk migration jobs at the location local.

#>
function Get-AzsDiskMigrationJob
{
    [OutputType([Microsoft.AzureStack.Management.Compute.Admin.Models.DiskMigrationJob])]
    [CmdletBinding(DefaultParameterSetName='List')]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ResourceId')]
        [System.String]
        [Alias('Id')]
        $ResourceId,

        [Parameter(Mandatory = $false, ParameterSetName = 'List')]
        [System.String]
        $Status,

        [Parameter(Mandatory = $false, ParameterSetName = 'Get')]
        [Parameter(Mandatory = $false, ParameterSetName = 'List')]
        [System.String]
        $Location,

        [Parameter(Mandatory = $true, ParameterSetName = 'Get')]
        [Alias('MigrationId')]
        [System.String]
        $Name
    )

    Begin
    {
	    Initialize-PSSwaggerDependencies -Azure
        $tracerObject = $null
        if (('continue' -eq $DebugPreference) -or ('inquire' -eq $DebugPreference)) {
            $oldDebugPreference = $global:DebugPreference
			$global:DebugPreference = "continue"
            $tracerObject = New-PSSwaggerClientTracing
            Register-PSSwaggerClientTracing -TracerObject $tracerObject
        }
	}

    Process {

		$NewServiceClient_params = @{
			FullClientTypeName = 'Microsoft.AzureStack.Management.Compute.Admin.ComputeAdminClient'
		}

		$GlobalParameterHashtable = @{}
		$NewServiceClient_params['GlobalParameterHashtable'] = $GlobalParameterHashtable

		$GlobalParameterHashtable['SubscriptionId'] = $null
		if($PSBoundParameters.ContainsKey('SubscriptionId')) {
			$GlobalParameterHashtable['SubscriptionId'] = $PSBoundParameters['SubscriptionId']
		}

		$ComputeAdminClient = New-ServiceClient @NewServiceClient_params

		$MigrationId = $Name


		if('ResourceId' -eq $PsCmdlet.ParameterSetName) {
			$GetArmResourceIdParameterValue_params = @{
				IdTemplate = '/subscriptions/{subscriptionId}/providers/Microsoft.Compute.Admin/locations/{location}/diskmigrationjobs/{migrationId}'
			}
			$GetArmResourceIdParameterValue_params['Id'] = $ResourceId

			$ArmResourceIdParameterValues = Get-ArmResourceIdParameterValue @GetArmResourceIdParameterValue_params
			$location = $ArmResourceIdParameterValues['location']

			$migrationId = $ArmResourceIdParameterValues['migrationId']
		}elseif (-not $PSBoundParameters.ContainsKey('Location')) {
				$Location = (Get-AzureRMLocation).Location
		}

		$filterInfos = @(
		@{
			'Type' = 'powershellWildcard'
			'Value' = $MigrationId
			'Property' = 'Name'
		})
		$applicableFilters = Get-ApplicableFilters -Filters $filterInfos
		if ($applicableFilters | Where-Object { $_.Strict }) {
			Write-Verbose -Message 'Performing server-side call ''Get-AzsDiskMigrationJob -'''
			$serverSideCall_params = @{

			}

			$serverSideResults = Get-AzsDiskMigrationJob @serverSideCall_params
			foreach ($serverSideResult in $serverSideResults) {
				$valid = $true
				foreach ($applicableFilter in $applicableFilters) {
					if (-not (Test-FilteredResult -Result $serverSideResult -Filter $applicableFilter.Filter)) {
						$valid = $false
						break
					}
				}

				if ($valid) {
					$serverSideResult
				}
			}
			return
		}
		if ('List' -eq $PsCmdlet.ParameterSetName) {
			Write-Verbose -Message 'Performing operation ListWithHttpMessagesAsync on $ComputeAdminClient.'
			$TaskResult = $ComputeAdminClient.DiskMigrationJobs.ListWithHttpMessagesAsync($Location, $(if ($PSBoundParameters.ContainsKey('Status')) { $Status } else { [NullString]::Value }))
		} elseif ('Get' -eq $PsCmdlet.ParameterSetName -or 'ResourceId' -eq $PsCmdlet.ParameterSetName) {
			Write-Verbose -Message 'Performing operation GetWithHttpMessagesAsync on $ComputeAdminClient.'
			$TaskResult = $ComputeAdminClient.DiskMigrationJobs.GetWithHttpMessagesAsync($Location, $MigrationId)
		} else {
			Write-Verbose -Message 'Failed to map parameter set to operation method.'
			throw 'Module failed to find operation to execute.'
		}

		if ($TaskResult) {
			$GetTaskResult_params = @{
				TaskResult = $TaskResult
			}

			Get-TaskResult @GetTaskResult_params

		}
    }

    End {
        if ($tracerObject) {
            $global:DebugPreference = $oldDebugPreference
            Unregister-PSSwaggerClientTracing -TracerObject $tracerObject
        }
    }
}

