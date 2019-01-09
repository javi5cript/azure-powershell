﻿# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

function Test-BmsGetContainer
{
	$vault = Get-AzRecoveryServicesVault -ResourceGroupName "pstestrg" -Name "pstestrsvault";
	$containers = Get-AzRecoveryServicesBackupManagementServer -VaultId $vault.ID;

	$namedContainer = Get-AzRecoveryServicesBackupManagementServer `
		-VaultId $vault.ID `
		-Name "PRCHIDEL-VEN2.FAREAST.CORP.MICROSOFT.COM";
	Assert-AreEqual $namedContainer.FriendlyName "PRCHIDEL-VEN2.FAREAST.CORP.MICROSOFT.COM";
}

function Test-BmsUnregisterContainer
{
	$vault = Get-AzRecoveryServicesVault -ResourceGroupName "pstestrg" -Name "pstestrsvault";
	
	$container = Get-AzRecoveryServicesBackupManagementServer `
		-VaultId $vault.ID `
		-Name "PRCHIDEL-VEN2.FAREAST.CORP.MICROSOFT.COM";
	Assert-AreEqual $container.FriendlyName "PRCHIDEL-VEN2.FAREAST.CORP.MICROSOFT.COM";

	Unregister-AzRecoveryServicesBackupManagementServer `
		-VaultId $vault.ID `
		-AzBackupManagementServer $container;
}