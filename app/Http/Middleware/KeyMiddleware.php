<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class KeyMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \Closure $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $key = $request->query("key");

        if (!isset($key)) {
            return response()->json([
                "error_message" => "You must use an API key to authenticate each request to Platform APIs. For additional information, please refer to http://g.co/dev/no-account",
                "results" => [],
                "status" => "REQUEST_DENIED"], 401);
        } else {
            $results = DB::table('keys')->where('key', $key)->first();

            if (!empty($results)) {
                $results = DB::table('keys')->where('key', $key)->update([
                    'hits' => $results->hits + 1
                ]);

                if ($results > 0) {
                    return $next($request);
                } else {
                    return response()->json([
                        "error_message" => "The provided API key is invalid.",
                        "results" => [],
                        "status" => "REQUEST_DENIED"], 401);
                }
            } else {
                return response()->json([
                    "error_message" => "The provided API key is invalid.",
                    "results" => [],
                    "status" => "REQUEST_DENIED"], 401);
            }
        }
    }
}
