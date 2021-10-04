<?php
/**
 * Created by PhpStorm.
 * User: elementary
 * Date: 23/09/19
 * Time: 21:59
 */

namespace App\Http\Controllers;


use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ContactController extends Controller
{
    /*
     * results token
     * results null = generate token failure
     *  */
    public function generateToken()
    {
        try {
            return bin2hex(random_bytes(32));
        } catch (\Exception $e) {
            return null;
        }
    }

    /*
     * results {data}
     * results null = contacts not found
     *  */
    public function firstContact(Request $request, $id)
    {
        $results = DB::table('contacts')->where('id', $id)->first();
        if ($results)
            return response()->json($results, 202);
        return response()->json($results, 404);
    }

    /*
     * results [data]
     * results []   = contacts not found
     *  */
    public function getContact()
    {
        $results = DB::table('contacts')->get();
        if ($results->count())
            return response()->json($results, 202);
        return response()->json($results, 404);
    }

    /*
     * results true
     * results false = contacts insert failure
     * */
    public function insertContact(Request $request)
    {
        try {
            $results = DB::table('contacts')->insert([
                'name' => $request->input('name'),
                'phone' => $request->input('phone'),
                'email' => $request->input('email')
            ]);
            if ($results)
                return response()->json($results, 201);
            return response()->json($results, 404);
        } catch (QueryException $queryException) {
            if ($queryException->errorInfo[1] == 1062)
                return response()->json($queryException, 409);
            return response()->json($queryException, 400);
        }
    }

    /*
     * results 1
     * results 0    = contacts update failure
     *  */
    public function updateContact(Request $request, $id)
    {
        try {
            $token = $this->generateToken();
            $results = DB::table('contacts')->where('id', $id)->update([
                'name' => $request->input('name'),
                'phone' => $request->input('phone'),
                'email' => $request->input('email'),
                'token' => $token,
                'updated_at' => date('Y-m-d H:i:s')
            ]);
            if ($results)
                return $this->firstContact($request, $id);
            return response()->json($results, 404);
        } catch (QueryException $queryException) {
            if ($queryException->errorInfo[1] == 1062)
                return response()->json($queryException, 409);
            return response()->json($queryException, 400);
        }
    }

    /*
     * results 1
     * results 0    = contacts delete failure
     *  */
    public function deleteContact($id)
    {
        try {
            $results = DB::table('contacts')->where('id', $id)->delete();
            if ($results)
                return response()->json($results, 202);
            return response()->json($results, 404);
        } catch (QueryException $queryException) {
            if ($queryException->errorInfo[1] == 1062)
                return response()->json($queryException, 409);
            return response()->json($queryException, 400);
        }
    }
}
