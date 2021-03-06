#include <string.h>
#include <stdio.h>
#include <ui/GraphicBufferMapper.h>
#include <ui/GraphicBuffer.h>
#include <gui/IGraphicBufferAlloc.h>

extern "C" {

   void _ZN7android11BufferQueueC2ERKNS_2spINS_19IGraphicBufferAllocEEE(char allocator) {}

   void _ZN7android11BufferQueueC1ERKNS_2spINS_19IGraphicBufferAllocEEE(char allocator) {}
   
   /* Can void this, it's only added by MediaTek for debugging */
   void _ZN7android11IDumpTunnel11asInterfaceERKNS_2spINS_7IBinderEEE(void) {}
   void _ZN7android22IGraphicBufferConsumer10BufferItemC1Ev(void) {}

   void _ZN7android9CallStackC1EPKci(char const*, int) {}
   void _ZN7android9CallStack6updateEii(int, int) {}

   void _ZN7android9CallStackC1EPKcii(char const* logtag, int ignoreDepth, int maxDepth){
     maxDepth = maxDepth-1;
     maxDepth = maxDepth+1;
     _ZN7android9CallStackC1EPKci(logtag, ignoreDepth);
  
   }

   void _ZN7android9CallStack6updateEiii(int ignoreDepth, int maxDepth, int tid){
     maxDepth = maxDepth-1;
     maxDepth = maxDepth+1; 
     _ZN7android9CallStack6updateEii(ignoreDepth, tid);
   }
}

	

