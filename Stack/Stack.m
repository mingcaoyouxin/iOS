//
//  Stack.m
//  Algorithm
//
//  Created by 浩 董 on 15/9/21.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//



#import "Stack.h"
#define EmptyTOS ( -1 )
#define MinStackSize ( 5 )
#define Error( Str )        FatalError( Str )
#define FatalError( Str )   fprintf( stderr, "%s\n", Str ), exit( 1 )

struct StackRecord
{
    int Capacity;
    int TopOfStack;
    ElementType *Array;
};

@implementation Stack

- (int)isEmpty:(stack)s
{
    return s->TopOfStack == EmptyTOS;
}

- (int) isFull:(stack)s
{
    return s->TopOfStack == s->Capacity - 1;
}

- (stack) createStack:(int) maxElements
{
    stack s;
    if( maxElements < MinStackSize )
        Error( "Stack size is too small");
    s = malloc( sizeof(struct StackRecord));
    if( s == NULL )
        FatalError( "Out of space!!!" );
    s->Array = malloc( sizeof( ElementType ) * maxElements );
    if( s->Array == NULL )
        FatalError( "Out of space!!!" );
    s->Capacity = maxElements;
    [self makeEmpty:s];
    return s;
}

- (void) makeEmpty:(stack)s
{
    s->TopOfStack = EmptyTOS;
}

- (void) disposeStack:(stack)s
{
    if( s != NULL )
    {
        free(s->Array);
        free(s);
    }
}
- (void) push:(ElementType)x  stack:(stack)s
{
    if([self isFull:s])
        Error( "Full stack" );
    else
        s->Array[ ++s->TopOfStack ] = x;
}

- (ElementType) top:(stack)s
{
    if( ![self isEmpty:s] )
        return s->Array[s->TopOfStack ];
    Error( "Empty stack" );
    return 0;  /* Return value used to avoid warning */
}

- (void) pop:(stack)s
{
    if( [self isEmpty:s] )
        Error( "Empty stack" );
    else
        s->TopOfStack--;
}
-(ElementType) topAndPop:(stack)s
{
    if( ![self isEmpty:s] )
        return s->Array[s->TopOfStack-- ];
    Error( "Empty stack" );
    return 0;
}
@end
