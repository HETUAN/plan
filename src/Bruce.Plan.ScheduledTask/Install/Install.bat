%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\installutil.exe Bruce.Plan.ScheduledTask.exe
Net Start PlanSync
sc config PlanSync start= auto
pause