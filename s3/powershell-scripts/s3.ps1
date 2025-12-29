# Import Module AWS.Tools.S3

$region = "us-east-1"
$bucketName = Read-Host "Enter the S3 bucket name"

Write-Host "AWS Region: $region"
Write-Host "S3 Bucket Name: $bucketName"

function bucketExists {
    $bucket = Get-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue 
    return $null -ne $bucket
}

if (-not (bucketExists)) {
    Write-Host "Bucket '$bucketName' does not exist in region '$region'."
    New-S3Bucket -BucketName $bucketName -Region $region
    Write-Host "Bucket '$bucketName' created successfully in region '$region'."
} 

else {
    Write-Host "Bucket '$bucketName' already exists in region '$region'."
}