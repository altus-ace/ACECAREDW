


CREATE VIEW [adw].[vw_Dashboard_AttribMembership_NPI]
AS

-- By Client, AcctType
SELECT ClientKey, ClientName, AttribNPI, AttribAcctType, EffYr, EffMth
	,CONCAT(EffYr,CONVERT(char(2),cast(EffMth as datetime), 101)) as EffYYYYMM
	,CONCAT(EffYr, '-', CONVERT(char(2),cast(EffMth as datetime), 101), '-01') as EffDate, COUNT(distinct CONCAT(ClientKey,ClientMemberKey)) as CntRec
	FROM dbo.z_tmp_AttribMembers_FINAL
	WHERE EffectiveAsOfDate = (SELECT MAX(EffectiveAsOfDate) FROM dbo.z_tmp_AttribMembers_FINAL)
GROUP BY ClientKey, ClientName, AttribNPI, AttribAcctType,EffYr, EffMth

