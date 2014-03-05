//
//  NSString+SLFrameworkTests.m
//  SLCategories
//
//  Created by Antti Laitala on 04/03/14.
//
//

#import <XCTest/XCTest.h>

#import "NSString+SLFramework.h"

@interface NSString_SLFrameworkTests : XCTestCase

@end

@implementation NSString_SLFrameworkTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testHex
{
    NSString *hex = nil;
    
    hex = @"a".hex;
    XCTAssert([hex isEqualToString:@"61"]);
    hex = @"ä".hex;
    XCTAssert([hex isEqualToString:@"c3a4"]);
    hex = @"阪, 熊, 奈, 岡, 鹿, 梨, 阜, 埼, 茨, 栃 and 媛.".hex;
    XCTAssert([hex isEqualToString:@"e998aa2c20e7868a2c20e5a5882c20e5b2a12c20e9b9bf2c20e6a2a82c20e9989c2c20e59fbc2c20e88ca82c20e6a08320616e6420e5aa9b2e"]);
    hex = @"".hex;
    XCTAssert([hex isEqualToString:@""]);
}

- (void)testDigest
{
    NSString *digest = nil;
    
    digest = @"a".digest;
    XCTAssert([digest isEqualToString:@"ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb"]);
    
    digest = [@"阪, 熊, 奈, 岡, 鹿, 梨, 阜, 埼, 茨, 栃 and 媛." digestUsingHashFunction:SLHashFunctionSHA224];
    XCTAssert([digest isEqualToString:@"50f36eb3f66469d51b8bde4ad54a49cd3ccd7249513ed601f42b2f4f"]);
    
    digest = [@"阪, 熊, 奈, 岡, 鹿, 梨, 阜, 埼, 茨, 栃 and 媛." digestUsingHashFunction:SLHashFunctionSHA256];
    XCTAssert([digest isEqualToString:@"bf014da8587f31639ff0370df7dedcc46c1a4a592fe924e429a8bcc1fab4040e"]);
    
    digest = [@"阪, 熊, 奈, 岡, 鹿, 梨, 阜, 埼, 茨, 栃 and 媛." digestUsingHashFunction:SLHashFunctionSHA384];
    XCTAssert([digest isEqualToString:@"37a3cf2e121eea7703da903576df5fdbc7f1cc252ceefcd44fab10283e72eb5c0964f3044219bd13ae9d1af8e4c947ed"]);
    
    digest = [@"阪, 熊, 奈, 岡, 鹿, 梨, 阜, 埼, 茨, 栃 and 媛." digestUsingHashFunction:SLHashFunctionSHA512];
    XCTAssert([digest isEqualToString:@"0a7d4b5ef3e745b54d08784d12ea1c30cdff874c79e7377f8d83e55187ab84a2402fd8b5584af280c84bf2fcdbe1b4c660f73f6e4ec10a1594631415b7308a3c"]);
    
    digest = [@"阪, 熊, 奈, 岡, 鹿, 梨, 阜, 埼, 茨, 栃 and 媛." digestUsingHashFunction:SLHashFunctionSHA512 salt:@"salt"];
    XCTAssert([digest isEqualToString:@"4aa8fa7d2bc0c7dd04f44eb3a133722ae4d79806a709af003307ae4a2a80f7d7e115fa207f8ba3ccfc13fd02207de31f404167e9c62e4a957fb8e5bcf0c79067"]);
}

@end